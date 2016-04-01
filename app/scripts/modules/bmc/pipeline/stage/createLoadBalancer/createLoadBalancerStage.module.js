'use strict';

let angular = require('angular');

module.exports = angular.module('spinnaker.bmc.pipeline.stage.createLoadBalancer', [
  require('./createLoadBalancerStage.js'),
  require('./createLoadBalancerExecutionDetails.controller.js'),
  require('../../../../core/pipeline/config/stages/stage.module.js'),
  require('../../../../core/pipeline/config/stages/core/stage.core.module.js'),
  require('../../../../core/account/account.module.js'),
  require('../../../../core/utils/lodash.js'),
]);
