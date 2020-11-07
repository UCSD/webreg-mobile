const {
  default: styled,
} = require('styled-components');

/* Theme */
export const COLOR_PRIMARY = '#034263';
export const COLOR_SECONDARY = '#BAE1FF';
export const COLOR_LIGHT_GREY = '#EAEAEA';
export const COLOR_GREY = '#c5c5c5';
export const COLOR_DARK_GREY = '#7D7D7D';
export const COLOR_WHITE = '#FFFFFF';

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
  border-bottom: 1px solid ${COLOR_LIGHT_GREY};
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
`;

export const CalendarTimeline = styled.div`
  font-size: 10px;
  letter-spacing: -0.02em;
  display: grid;
  grid-template-rows: repeat(15, ${CALENDAR_ROW_HEIGHT});
`;

export const CalendarTimelineItem = styled(FlexContainer)`
  height: 100%;
  width: 100%;
  border-bottom: 1px solid ${COLOR_LIGHT_GREY};
`;
