" Frequently used macros

" Test with tape
let @t = 'Gotest(`,testedFucntion whatIsTested`, assert => {const actual = 1;const expected = 1;assert.deepE(actual, expected,`expected bheaviour`);assert.end();});'
