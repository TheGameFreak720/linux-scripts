'use strict';

process.environment = 'development';
require('coffeescript').register();

const _     = require('lodash');
const model = require('model');
const async = require('async');

const log   = require('modules/log');
const superMerge = require('modules/supermerge');
const shhhh = require('./keys').connections.secret;
const dbRouter = require("modules/db-router");

dbRouter.startUp(shhhh);
console.info(`Starting Up [${process.environment}] for Blank Script Run.`);

// Write your code here

// Don't forget to exit! process.exit(0)
