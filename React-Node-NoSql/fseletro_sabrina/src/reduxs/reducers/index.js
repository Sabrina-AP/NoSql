import {clickReducer } from './clickReducer';
import { combineReducers } from 'redux';


import {fcReducer} from './fcReducer';


export const Reducers = combineReducers({
    clickState: clickReducer,
    fcState: fcReducer
});