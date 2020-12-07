import { rgba } from 'polished';
import {
  COLOR_GREY,
  COLOR_LIGHT_GREY,
  COLOR_SECONDARY,
  COLOR_PRIMARY,
} from './theme';

const {
  default: styled,
} = require('styled-components');

/* Components */
export const CALENDAR_TIME_COL_WIDTH = '35px';
export const CALENDAR_ROW_HEIGHT = '56px';
export const CALENDAR_HORIZONTAL_PADDING = '10px';

export const FlexContainer = styled.div`
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: center;
  height: 100%;
  width: 100%;
`;

export const CalendarContainer = styled.div`
  height: 100%;
  overflow: hidden;
  display: grid;
  grid-template-rows: 50px 1fr;
`;

export const CalendarHeader = styled.div`
  display: flex;
  margin: 0 ${CALENDAR_HORIZONTAL_PADDING};
  padding: 20px 0 15px 0;
  border-bottom: 1px solid ${COLOR_GREY};
`;

export const CalendarHeaderItem = styled.div`
font-size: 10px;
text-align: center;
letter-spacing: -0.02em;
${(props) => (
    props.time
      ? `width: ${CALENDAR_TIME_COL_WIDTH};`
      : 'flex: 1;')}
`;

export const CalendarBody = styled.div`
  overflow-y: scroll;
  height: 100%;
  padding: 0 ${CALENDAR_HORIZONTAL_PADDING};
  display: grid;
  grid-template-columns: ${CALENDAR_TIME_COL_WIDTH} 1fr;
  &::-webkit-scrollbar {
    display: none;
  }
  -ms-overflow-style: none;  /* IE and Edge */
  scrollbar-width: none;  /* Firefox */
`;

export const CalendarGrid = styled.div`
  display: grid;
  grid-template-rows: repeat(15, ${CALENDAR_ROW_HEIGHT});
`;

export const CalendarGridItem = styled(FlexContainer)`
  height: 100%;
  width: 100%;
  border-bottom: 1px solid ${COLOR_LIGHT_GREY};
`;

export const CalendarTimeline = styled(CalendarGrid)`
  font-size: 10px;
  letter-spacing: -0.02em;
`;

export const CalendarTimelineItem = CalendarGridItem;

export const CalendarSchedule = styled(CalendarGrid)`
  position: relative;
`;

export const CalendarScheduleItem = CalendarGridItem;

export const CalendarCourseContainer = styled.div`
  position: absolute;
  display: grid;
  column-gap: 1px;
  padding: 0 1px;
  width: 100%;
  height: 100%;
  grid-template-rows: repeat(90, 1fr);
  grid-template-columns: repeat(7, 1fr);
`;

export const CalendarCardHeader = styled(FlexContainer)`
  font-weight: bold;
  font-size: 9px;
  background-color: ${COLOR_SECONDARY};
`;

export const CalendarCardBody = styled(FlexContainer)`
  flex-direction: column;
  font-size: 8px;
  height: 100%;
  letter-spacing: -0.02em;
`;

export const CalendarCardTitle = styled.div`
  font-size: 9px;
  font-weight: bold;
  line-height: 10px;
`;

export const CalendarCard = styled.div`
  width: 100%;
  height: 100%;
  position: relative;
  display: grid;
  grid-template-rows: 15px calc(100% - 15px);
  box-shadow: 1px 1px 2.5px ${rgba(0, 0, 0, 0.25)}, -1px 1px 2.5px ${rgba(0, 0, 0, 0.25)};
  border-radius: 2px;
  background-color: white;
  text-transform: uppercase;
  overflow: hidden;
  box-sizing: border-box;
  border-color: ${rgba(0, 0, 0, 0)};

  ${(props) => (
    props.focused
  && `
   border: 1px solid ${COLOR_PRIMARY};
   border-radius: 3px;
   grid-template-rows: 14px calc(100% - 13px);
  `
  )}

  -moz-transition: all .2s linear !important;
  -webkit-transition: all .2s linear !important;
  transition: all 0.2s linear !important;
`;
