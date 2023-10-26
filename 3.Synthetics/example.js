var assert = require('assert');
await $webDriver.get('http://example.com');
const h1 = await $webDriver.findElement($driver.By.css('h1'));
const text = await h1.getText();
assert.equal('Example Domain', text, 'Page H1 title did not match');