'use strict';

let angular = require('angular');

// load all templates into the $templateCache
var templates = require.context('./', true, /\.html$/);
templates.keys().forEach(function(key) {
  templates(key);
});

module.exports = angular
  .module('spinnaker.bmc', [
    require('./pipeline/stage/createLoadBalancer/createLoadBalancerStage.module.js'),

//    require('./templateOverride/templateOverrides.module.js'),

//    require('./help/netflixHelpContents.registry.js'),

    require('../core/config/settings.js'),
  ])
  .run(function(cloudProviderRegistry, settings) {
/*
    if (settings.feature && settings.feature.netflixMode) {
      cloudProviderRegistry.overrideValue(
        'aws',
        'instance.detailsTemplateUrl',
        require('./instance/aws/instanceDetails.html')
      );
      cloudProviderRegistry.overrideValue(
        'aws',
        'instance.detailsController',
        'netflixAwsInstanceDetailsCtrl'
      );
      cloudProviderRegistry.overrideValue(
        'aws',
        'serverGroup.detailsTemplateUrl',
        require('./serverGroup/awsServerGroupDetails.html')
      );
    }
*/
  });
