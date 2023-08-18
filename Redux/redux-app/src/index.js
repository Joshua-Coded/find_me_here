import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';

import {createStore} from 'redux';

// redux state
const defaultState = 0;

//reducer for redux state

const balancerReducer = (state = defaultState, action) => {
  switch(action.type) {
    case 'DEPOSIT':
      return state + 100
    case 'WITHDRAW':
      return state - 100
    default:
      return state;
  }
}

// store redux state
const store = createStore(balancerReducer);

// get the updated value for our stores

store.dispatch({type: 'DEPOSIT'});
console.log(store.getState());

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
