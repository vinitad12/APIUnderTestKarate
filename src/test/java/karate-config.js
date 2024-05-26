function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    app_url: 'http://localhost_NIS:4200'
  }
  if (env == 'dev') {
    config.app_url = 'http://localhost:4200/incorrect'
  }
  if (env == 'qa') {
    config.app_url = 'http://localhost:4200'
  }

  return config;
}