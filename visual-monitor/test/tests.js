'use strict';

var shoovWebdrivercss = require('shoov-webdrivercss');
var projectName = 'unfpa-endfistula';

// This can be executed by passing the environment argument like this:
// PROVIDER_PREFIX=browserstack SELECTED_CAPS=chrome mocha
// PROVIDER_PREFIX=browserstack SELECTED_CAPS=ie11 mocha
// PROVIDER_PREFIX=browserstack SELECTED_CAPS=iphone5 mocha

var capsConfig = {
  'chrome': {
    project: projectName,
    'browser' : 'Chrome',
    'browser_version' : '42.0',
    'os' : 'OS X',
    'os_version' : 'Yosemite',
    'resolution' : '1024x768'
  },
  'ie11': {
    project: projectName,
    'browser' : 'IE',
    'browser_version' : '11.0',
    'os' : 'Windows',
    'os_version' : '7',
    'resolution' : '1024x768'
  },
  'iphone5': {
    project: projectName,
    'browser' : 'Chrome',
    'browser_version' : '42.0',
    'os' : 'OS X',
    'os_version' : 'Yosemite',
    'chromeOptions': {
      'mobileEmulation': {
        'deviceName': 'Apple iPhone 5'
      }
    }
  }
};

var selectedCaps = process.env.SELECTED_CAPS || undefined;
var caps = selectedCaps ? capsConfig[selectedCaps] : undefined;

var providerPrefix = process.env.PROVIDER_PREFIX ? process.env.PROVIDER_PREFIX + '-' : '';
var testName = selectedCaps ? providerPrefix + selectedCaps : providerPrefix + 'default';

var baseUrl = process.env.BASE_URL ? process.env.BASE_URL : 'http://www.endfistula.org';

var resultsCallback = process.env.DEBUG ? console.log : shoovWebdrivercss.processResults;

describe('Visual monitor testing', function() {

  this.timeout(99999999);
  var client = {};

  before(function(done){
    client = shoovWebdrivercss.before(done, caps);
  });

  after(function(done) {
    shoovWebdrivercss.after(done);
  });

  it('should show the home page',function(done) {
    client
      .url(baseUrl)
      .pause(10000)
      .webdrivercss(testName + '.homepage', {
        name: '1',
        exclude:
          [
            // Carousel.
            '.slider-for',
            '.slick-active',
            // News.
            '.views-field-field-video',
            // Publications.
            '.pane-vw-publications img',
            // Side banners.
            '.side_banners a'
          ],
        remove:
          [
            // News.
            '.news-body',
            // Publications.
            '.pane-vw-publications .title',
            '.pane-vw-publications .summary',
            '.views-field-title'
          ],
        hide: [],
        screenWidth: selectedCaps == 'chrome' ? [640, 960, 1200] : undefined,
      }, resultsCallback)
      .call(done);
  });

  it('should show the news page',function(done) {
    client
      .url(baseUrl + '/news')
      .webdrivercss(testName + '.news', {
        name: '1',
        exclude:
          [
            // Article.
            '.item img',
            // Video.
            '.media-youtube-video',
          ],
        remove:
          [
            // Article
            '.item .right',
            // Video
            '.views-field-title'
          ],
        hide: [],
        screenWidth: selectedCaps == 'chrome' ? [640, 960, 1200] : undefined,
      }, resultsCallback)
      .call(done);
  });

  it('should show the news article page',function(done) {
    client
      .url(baseUrl + '/news/fistula-continuing-destroy-lives-developing-world')
      .webdrivercss(testName + '.news-article', {
        name: '1',
        exclude: [],
        remove:
          [
            // Related news.
            '.item .description',
            '.item img',
          ],
        hide: [],
        screenWidth: selectedCaps == 'chrome' ? [640, 960, 1200] : undefined,
      }, resultsCallback)
      .call(done);
  });

  it('should show the publications page',function(done) {
    client
      .url(baseUrl + '/publications')
      .webdrivercss(testName + '.publications', {
        name: '1',
        exclude:
          [
            // Article.
            '.left img',
          ],
        remove:
          [
            // Article.
            '.right .title',
            '.right p',
          ],
        hide: [],
        screenWidth: selectedCaps == 'chrome' ? [640, 960, 1200] : undefined,
      }, resultsCallback)
      .call(done);
  });
});
