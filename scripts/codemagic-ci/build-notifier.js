const fetch = require('node-fetch')
const AbortController = require('abort-controller')
const moment = require('moment')
const fs = require('fs')
const util = require('util')
const download = require('download')
const XlsxTemplate = require('xlsx-template')
const spsave = require('spsave').spsave
const ENV_VARS = require('./env-vars.json')
const SP_CONFIG = require('./sp-config.json')

const INTERNAL_ERROR = { 'error': 'An error occurred.' }
const INTERNAL_TIMEOUT = 20000
const finalBuildNumber = parseInt(ENV_VARS.buildNumber)
const buildApkFile = 'app-release.apk'
const buildIpaFile = 'UC_San_Diego.ipa'
const buildWebFile = 'web-web.zip'
const buildArtifacts = {}

ENV_VARS.commitHash = ENV_VARS.commitHash.substring(0, 7)

const buildNotify = async () => {
	try {
		const buildTimestamp = moment().format('YYYY-MM-DD h:mm A')
		const fciProjectLink = 'https://codemagic.io/app/' + ENV_VARS.fciProjectId + '/build/' + ENV_VARS.fciBuildId

		let buildSuccess = (ENV_VARS.fciBuildStepStatus === 'success') ? true : false
		let prAuthor = ''
		let saveArtifactApkSuccess = false
		let saveArtifactIpaSuccess = false
		let saveArtifactWebSuccess = false
		let testPlanFilename = ''
		let testPlanUrl = ''

		console.log('ENV_VARS.fciBuildStepStatus: ' + ENV_VARS.fciBuildStepStatus)
		console.log('buildSuccess: ' + buildSuccess)
		console.log('buildPlatform: ' + ENV_VARS.buildPlatform)
		// Check build success
		if (buildSuccess) {
			// Supplemental GitHub metadata for PRs
			if (ENV_VARS.prNumber) {
				prAuthor = await githubMeta()
			}

			// Save build artifacts
			if (ENV_VARS.buildPlatform === 'IOS') {
				saveArtifactIpaSuccess = await saveArtifact(buildIpaFile)
			} else if (ENV_VARS.buildPlatform === 'ANDROID') {
				saveArtifactApkSuccess = await saveArtifact(buildApkFile)
			} else if (ENV_VARS.buildPlatform === 'WEB') {
				saveArtifactWebSuccess = await saveArtifact(buildWebFile)
			}

			// Generate test plan
			;({ testPlanFilename, testPlanUrl } = await generateTestPlan(prAuthor))
		}

		console.log('saveArtifactIpaSuccess: ' + saveArtifactIpaSuccess)
		console.log('saveArtifactApkSuccess: ' + saveArtifactApkSuccess)
		console.log('saveArtifactWebSuccess: ' + saveArtifactWebSuccess)

		// Construct build notifier message
		let teamsMessage = '#### Webreg Build Notifier\n\n'
		teamsMessage += '<table border="0" style="margin:16px">'
		teamsMessage += '<tr style="border-bottom: 1px solid grey"><td align="right"><b>Version:</b></td><td>' + ENV_VARS.appVersion + ' (' + finalBuildNumber + ')</td></tr>'
		teamsMessage += '<tr style="border-bottom: 1px solid grey"><td align="right"><b>Environment:</b></td><td>' + ENV_VARS.buildEnv + '</td></tr>'

		// PR or Branch
		if (ENV_VARS.prNumber) {
			teamsMessage += '<tr style="border-bottom: 1px solid grey"><td align="right"><b>PR:</b></td><td><a href="https://github.com/UCSD/campus-mobile/pull/' + ENV_VARS.prNumber + '" style="text-decoration:underline">' + ENV_VARS.prNumber + '</a></td></tr>'
			teamsMessage += '<tr style="border-bottom: 1px solid grey"><td align="right"><b>Author:</b></td><td>' + prAuthor + '</td></tr>'
		} else {
			teamsMessage += '<tr style="border-bottom: 1px solid grey"><td align="right"><b>Branch:</b></td><td>' + ENV_VARS.buildBranch + '</td></tr>'
			teamsMessage += '<tr style="border-bottom: 1px solid grey"><td align="right"><b>Commit:</b></td><td><a href="https://github.com/UCSD/campus-mobile/commit/' + ENV_VARS.commitHash + '" style="text-decoration:underline">' + ENV_VARS.commitHash + '</a></td></tr>'
		}

		// Build Artifacts
		if (ENV_VARS.buildPlatform === 'IOS') {
			if (saveArtifactIpaSuccess) {
				teamsMessage += '<tr style="border-bottom: 1px solid grey"><td align="right"><b>iOS:</b></td><td><a href="https://mobile.ucsd.edu/testflight" style="text-decoration:underline">TestFlight ' + ENV_VARS.appVersion + ' (' + finalBuildNumber + ')</a></td></tr>'
			} else {
				teamsMessage += '<tr style="border-bottom: 1px solid grey"><td align="right"><b>iOS:</b></td><td><span style="color:#d60000">N/A</span></td></tr>'
			}
		} else if (ENV_VARS.buildPlatform === 'ANDROID') {
			if (saveArtifactApkSuccess) {
				teamsMessage += '<tr style="border-bottom: 1px solid grey"><td align="right"><b>Android:</b></td><td><a href="' + buildArtifacts.buildApkFinalUrl + '" download style="text-decoration:underline">' + buildArtifacts.buildApkFinalFilename + '</a></td></tr>'
			} else {
				teamsMessage += '<tr style="border-bottom: 1px solid grey"><td align="right"><b>Android:</b></td><td><span style="color:#d60000">N/A</span></td></tr>'
			}
		} else if (ENV_VARS.buildPlatform === 'WEB') {
			if (saveArtifactWebSuccess) {
				if (ENV_VARS.buildEnv === 'PROD') {
					teamsMessage += '<tr style="border-bottom: 1px solid grey"><td align="right"><b>URL:</b></td><td><a href="' + SP_CONFIG.webregBaseUrlProd + ENV_VARS.appVersion + '-' + finalBuildNumber + '/index.html" style="text-decoration:underline">/webreg-mobile/' + ENV_VARS.appVersion + '-' + finalBuildNumber + '/index.html</a></td></tr>'
				} else if (ENV_VARS.buildEnv === 'QA') {
					teamsMessage += '<tr style="border-bottom: 1px solid grey"><td align="right"><b>URL:</b></td><td><a href="' + SP_CONFIG.webregBaseUrlQa + ENV_VARS.appVersion + '-' + finalBuildNumber + '/index.html" style="text-decoration:underline">/webreg-mobile/' + ENV_VARS.appVersion + '-' + finalBuildNumber + '/index.html</a></td></tr>'
				}
				teamsMessage += '<tr style="border-bottom: 1px solid grey"><td align="right"><b>Archive:</b></td><td><a href="' + buildArtifacts.buildWebFinalUrl + '" download style="text-decoration:underline">' + buildArtifacts.buildWebFinalFilename + '</a></td></tr>'
			} else {
				teamsMessage += '<tr style="border-bottom: 1px solid grey"><td align="right"><b>Archive:</b></td><td><span style="color:#d60000">N/A</span></td></tr>'
			}
		}

		// Test plan
		if (testPlanUrl && testPlanFilename) {
			teamsMessage += '<tr style="border-bottom: 1px solid grey"><td align="right"><b>Test Plan:</b></td><td><a href="' + testPlanUrl + '" style="text-decoration:underline">' + testPlanFilename + '</a></td></tr>'
		}

		const successEmojiList = ['🥇','🏆','🎖','🎉','🎊','🚀','🛫','🏋','💪','👏','💯']
		const failedEmojiList = ['🙀','😱','😵']

		// Build success or failure
		if (buildSuccess &&
			(
				(saveArtifactApkSuccess && ENV_VARS.buildPlatform === 'ANDROID') ||
				(saveArtifactIpaSuccess && ENV_VARS.buildPlatform === 'IOS') ||
				(saveArtifactWebSuccess && ENV_VARS.buildPlatform === 'WEB')
			)
		) {
			const successEmoji = successEmojiList[Math.floor(Math.random() * successEmojiList.length)]
			teamsMessage += '<tr style="border-bottom: 1px solid grey"><td align="right"><b>Status:</b></td><td><span style="color:#12a102">BUILD SUCCESS ' + successEmoji + '</span> (<a href="' + fciProjectLink + '" style="text-decoration:underline">detail</a>)</td></tr>'
		} else {
			const failedEmoji = failedEmojiList[Math.floor(Math.random() * failedEmojiList.length)]
			teamsMessage += '<tr style="border-bottom: 1px solid grey"><td align="right"><b>Status:</b></td><td><span style="color:#d60000">BUILD FAILED ' + failedEmoji + '</span> (<a href="' + fciProjectLink + '" style="text-decoration:underline">detail</a>)</td></tr>'
		}

		teamsMessage += '<tr><td align="right"><b>Time:</b></td><td width="320">' + buildTimestamp + '</td></tr>'
		teamsMessage += '</table>'

		// Send notification via webhook integration
		console.log('Sending Teams notification for UC San Diego ' + ENV_VARS.appVersion + ' (' + finalBuildNumber + ')\n')
		const notifyController = new AbortController()
		const notifyTimeout = setTimeout(() => { notifyController.abort() }, INTERNAL_TIMEOUT)
		const notifyResp = await fetch(SP_CONFIG.webhookUrl, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({
				'text': teamsMessage
			}),
			signal: notifyController.signal,
		})
		clearTimeout(notifyTimeout)

		if (notifyResp.statusText != 'OK') {
			throw 'Error: Unable to POST to webhookUrl (status: ' + notifyResp.statusText + ')'
		}
	} catch (err) {
		console.log(err)
		process.exitCode = 1
	}
}

const saveArtifact = async (artifactFilename) => {
	try {
		// Exit if artifact filename unavailable (build failed)
		if (!artifactFilename) {
			console.log('Error: saveArtifact: artifact filename unavailable (build failed)')
			return false
		}

		const buildFilenamePrEnvStr = ENV_VARS.prNumber ? '-PR-' + ENV_VARS.prNumber : '-' + ENV_VARS.buildEnv
		const buildFolder = ENV_VARS.prNumber ? SP_CONFIG.spPullRequestBuildFolder : SP_CONFIG.spRegressionBuildFolder	
		const coreOptions = { siteUrl: SP_CONFIG.spSiteUrl }
		const fileOptions = { folder: ENV_VARS.prNumber ? SP_CONFIG.spPullRequestBuildFolder : SP_CONFIG.spRegressionBuildFolder }

		// Save build artifacts to SP
		if (ENV_VARS.buildPlatform === 'ANDROID') {
			buildArtifacts.buildApkFilepath = '../../build/app/outputs/apk/release/app-release.apk'
			buildArtifacts.buildApkFinalFilename = ENV_VARS.appVersion + '-' + finalBuildNumber + buildFilenamePrEnvStr + '.apk'
			buildArtifacts.buildApkFinalUrl = (SP_CONFIG.spSiteUrl + buildFolder + buildArtifacts.buildApkFinalFilename).replace(/ /g, '%20')
			fs.copyFileSync(buildArtifacts.buildApkFilepath, './' + buildArtifacts.buildApkFinalFilename)
			fileOptions.fileName = buildArtifacts.buildApkFinalFilename
			fileOptions.fileContent = fs.readFileSync(buildArtifacts.buildApkFinalFilename)
			console.log('Saving artifact `' + fileOptions.fileName + ' to SP...')
			await spsave(coreOptions, SP_CONFIG.credentials, fileOptions)
			return true
		} else if (ENV_VARS.buildPlatform === 'IOS') {
			buildArtifacts.buildIpaFilepath = '../../build/ios/ipa/UC San Diego.ipa'
			buildArtifacts.buildIpaFinalFilename = ENV_VARS.appVersion + '-' + finalBuildNumber + buildFilenamePrEnvStr + '.ipa'
			buildArtifacts.buildIpaFinalUrl = (SP_CONFIG.spSiteUrl + buildFolder + buildArtifacts.buildIpaFinalFilename).replace(/ /g, '%20')
			fs.copyFileSync(buildArtifacts.buildIpaFilepath, './' + buildArtifacts.buildIpaFinalFilename)
			fileOptions.fileName = buildArtifacts.buildIpaFinalFilename
			fileOptions.fileContent = fs.readFileSync(buildArtifacts.buildIpaFinalFilename)
			console.log('Saving artifact `' + fileOptions.fileName + ' to SP...')
			await spsave(coreOptions, SP_CONFIG.credentials, fileOptions)
			return true
		} else if (ENV_VARS.buildPlatform === 'WEB') {
			buildArtifacts.buildWebFilepath = '../../build/' + buildWebFile
			buildArtifacts.buildWebFinalFilename = ENV_VARS.appVersion + '-' + finalBuildNumber + buildFilenamePrEnvStr + '.zip'
			buildArtifacts.buildWebFinalUrl = (SP_CONFIG.spSiteUrl + buildFolder + buildArtifacts.buildWebFinalFilename).replace(/ /g, '%20')
			fs.copyFileSync(buildArtifacts.buildWebFilepath, './' + buildArtifacts.buildWebFinalFilename)
			fileOptions.fileName = buildArtifacts.buildWebFinalFilename
			fileOptions.fileContent = fs.readFileSync(buildArtifacts.buildWebFinalFilename)
			console.log('Saving artifact `' + fileOptions.fileName + ' to SP...')
			await spsave(coreOptions, SP_CONFIG.credentials, fileOptions)
			return true
		}
		return false
	} catch(err) {
		console.log(err)
		return false
	}
}

const generateTestPlan = async (prAuthor) => {
	try {
		let testPlanFilename
		let testPlanUrl
		if (ENV_VARS.prNumber) {
			console.log('Generating test plan for PR ' + ENV_VARS.prNumber)
			testPlanFilename = 'PR-' + ENV_VARS.prNumber + '-Test-Plan-' + ENV_VARS.appVersion + '-' + ENV_VARS.buildEnv + '-' + finalBuildNumber + '.xlsx'
			testPlanUrl = (SP_CONFIG.spSiteUrl + SP_CONFIG.spPullRequestTestFolder + testPlanFilename + '?web=1').replace(/ /g, '%20')
			console.log('  (1/3) Downloading PR test plan template ...')
			if (ENV_VARS.buildPlatform === 'IOS') {
				fs.writeFileSync(testPlanFilename, await download(SP_CONFIG.prTestPlanTemplateUrlIos))
			} else if (ENV_VARS.buildPlatform === 'ANDROID') {
				fs.writeFileSync(testPlanFilename, await download(SP_CONFIG.prTestPlanTemplateUrlAndroid))
			} else if (ENV_VARS.buildPlatform === 'WEB') {
				fs.writeFileSync(testPlanFilename, await download(SP_CONFIG.prTestPlanTemplateUrlWeb))
			}
		} else {
			console.log('Generating regression test plan for branch ' + ENV_VARS.buildBranch)
			testPlanFilename = 'Regression-Test-Plan-' + ENV_VARS.appVersion + '-' + ENV_VARS.buildEnv + '-' + finalBuildNumber + '.xlsx'
			testPlanUrl = (SP_CONFIG.spSiteUrl + SP_CONFIG.spRegressionTestFolder + testPlanFilename + '?web=1').replace(/ /g, '%20')
			switch(ENV_VARS.buildEnv) {
				case 'PROD':
					console.log('  (1/3) Downloading PROD regression test plan template ...')
					if (ENV_VARS.buildPlatform === 'IOS') {
						fs.writeFileSync(testPlanFilename, await download(SP_CONFIG.prodRegressionTestPlanTemplateUrlIos))						
					} else if (ENV_VARS.buildPlatform === 'ANDROID') {
						fs.writeFileSync(testPlanFilename, await download(SP_CONFIG.prodRegressionTestPlanTemplateUrlAndroid))
					} else if (ENV_VARS.buildPlatform === 'WEB') {
						fs.writeFileSync(testPlanFilename, await download(SP_CONFIG.prodRegressionTestPlanTemplateUrlWeb))
					}
					break
				default:
					console.log('  (1/3) Downloading QA regression test plan template ...')
					if (ENV_VARS.buildPlatform === 'IOS') {
						fs.writeFileSync(testPlanFilename, await download(SP_CONFIG.qaRegressionTestPlanTemplateUrlIos))						
					} else if (ENV_VARS.buildPlatform === 'ANDROID') {
						fs.writeFileSync(testPlanFilename, await download(SP_CONFIG.qaRegressionTestPlanTemplateUrlAndroid))
					} else if (ENV_VARS.buildPlatform === 'WEB') {
						fs.writeFileSync(testPlanFilename, await download(SP_CONFIG.qaRegressionTestPlanTemplateUrlWeb))
					}
			}
		}

		console.log('  (2/4) Making replacements ...')
		const data = fs.readFileSync(testPlanFilename)
		const template = new XlsxTemplate(data)
		const sheetNumber = 1
		const values = {
			APP_VERSION: ENV_VARS.appVersion,
			BUILD_ENV: ENV_VARS.buildEnv,
			BUILD_NUMBER: finalBuildNumber,
			BUILD_BRANCH: ENV_VARS.buildBranch,
		}
		if (ENV_VARS.prNumber) {
			values.PR_AUTHOR = prAuthor
			values.PR_NUMBER = ENV_VARS.prNumber
		}

		template.substitute(sheetNumber, values)

		console.log('  (3/4) Writing ' + testPlanFilename)
		fs.writeFileSync(testPlanFilename, Buffer.from(
			template.generate({type: 'base64'}),
			'base64'
		))

		console.log('  (4/4) Uploading test plan for build ' + finalBuildNumber)
		const coreOptions = { siteUrl: SP_CONFIG.spSiteUrl }
		const fileOptions = {
			folder: ENV_VARS.prNumber ? SP_CONFIG.spPullRequestTestFolder : SP_CONFIG.spRegressionTestFolder,
			fileName: testPlanFilename,
			fileContent: fs.readFileSync(testPlanFilename)
		}
		await spsave(coreOptions, SP_CONFIG.credentials, fileOptions)
		return {
			testPlanFilename: testPlanFilename,
			testPlanUrl: testPlanUrl,
		}
	} catch(err) {
		console.log(err)
		return null
	}
}

const githubMeta = async () => {
	try {
		console.log('Fetching GitHub metadata for PR ' + ENV_VARS.prNumber)
		const ghController = new AbortController()
		const ghTimeout = setTimeout(() => { ghController.abort() }, INTERNAL_TIMEOUT)
		const ghResp = await fetch('https://api.github.com/repos/UCSD/campus-mobile/pulls/' + ENV_VARS.prNumber, { signal: ghController.signal })
		const ghRespJson = await ghResp.json()
		clearTimeout(ghTimeout)
		return ghRespJson.user.login
	} catch (err) {
		console.log(err)
		return 'n/a'
	}
}

buildNotify()
