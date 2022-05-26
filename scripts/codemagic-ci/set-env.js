// set environment for specificed repo
const os = require('os')
const fs = require('fs')
const path = require('path')
const util = require('util')
const exec = util.promisify(require('child_process').exec)

// Config - See README
const config = require('./app-config.js')
const targetEnv = process.argv[2]
const appVersion = process.argv[3]
const buildNumber = process.argv[4]

// Environment Replacements
const prodEnvReplacements = async (targetEnv) => {
	try {
		config.PROD_ENV_REPLACEMENTS.forEach((envItem) => {
			fs.readFile(envItem.PATH, 'utf8', (err, data) => {
				envItem.QA.forEach((replacement, index) => {
					if (replacement === '"##BUILD_ENV##"') {
						data = data.replace(replacement, '"' + targetEnv + '"')
					} else if (replacement === 'version: 1.0.0+1') {
						data = data.replace(replacement, 'version: ' + appVersion + '+' + buildNumber)
					} else {
						data = data.replace(replacement, envItem.PROD[index])
					}
				})
				fs.writeFile(envItem.PATH, data, 'utf8', (err) => {
					if (err) throw err
					else console.log(envItem.PATH + ' --> ' + targetEnv)
				})
			})
		})
	} catch (err) {
		throw err
	}
}

const qaEnvReplacements = async (targetEnv) => {
	try {
		config.QA_ENV_REPLACEMENTS.forEach((envItem) => {
			fs.readFile(envItem.PATH, 'utf8', (err, data) => {
				envItem.QA.forEach((replacement, index) => {
					if (replacement === '"##BUILD_ENV##"') {
						data = data.replace(replacement, '"' + targetEnv + '"')
					} else if (replacement === 'version: 1.0.0+1') {
						data = data.replace(replacement, 'version: ' + appVersion + '+' + buildNumber)
					} else {
						data = data.replace(replacement, envItem.PROD[index])
					}
				})
				fs.writeFile(envItem.PATH, data, 'utf8', (err) => {
					if (err) throw err
					else console.log(envItem.PATH + ' --> ' + targetEnv)
				})
			})
		})
	} catch (err) {
		throw err
	}
}

try {
	if (targetEnv === 'PROD') {
		prodEnvReplacements(targetEnv)
	} else if (targetEnv === 'QA') {
		qaEnvReplacements(targetEnv)
	} else {
		throw 'Sample usage: node set-env PROD|QA'
	}
} catch (err) {
	console.log('⚠ ERROR: Environment setup failed ⚠')
	console.log(err)
}
