(function() {
  'use strict';

  angular
    .module('angularjs')
    .run(runBlock);

  /** @ngInject */
  function runBlock($log) {

    $log.debug('runBlock end');
  }

})();
