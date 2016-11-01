(function() {
  'use strict';

  angular
    .module('angularjs')
    .controller('TestController', TestController);
  angular
    .module('angularjs')
    .controller('MainController', MainController);

  /** @ngInject */
  function MainController($timeout, webDevTec, toastr) {
    var vm = this;

    vm.awesomeThings = [];
    vm.classAnimation = '';
    vm.creationDate = 1477450010611;
    vm.showToastr = showToastr;

    activate();

    function activate() {
      getWebDevTec();
      $timeout(function() {
        vm.classAnimation = 'rubberBand';
      }, 4000);
    }

    function showToastr() {
      toastr.info('Fork <a href="https://github.com/Swiip/generator-gulp-angular" target="_blank"><b>generator-gulp-angular</b></a>');
      vm.classAnimation = '';
    }

    function getWebDevTec() {
      vm.awesomeThings = webDevTec.getTec();

      angular.forEach(vm.awesomeThings, function(awesomeThing) {
        awesomeThing.rank = Math.random();
      });
    }
  }

  function TestController($http,$log) {
    var vm = this;
    vm.user = [];
    vm.t = 'sth';
//$http.defaults.headers.common['Access-Control-Allow-Origin'] = '*';

      $http.defaults.withCredentials = true,
      $http({
        method: 'GET',
        url: 'http://127.0.0.1/~lily/vumc/web/index.php/admin/'
      }).then(function successCallback(response) {
        vm.user = response.data;
        $log.log("response:",response.data);
      },function errorCallback(response){
        $log.log(response);
        vm.user = null;
      });
  }

})();
