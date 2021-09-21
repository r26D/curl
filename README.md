# GitHub Action - wait for status

This hits a specific url on an interval until a specific status is the result

## Usage


statusCode defaults to 200
checkIntervalSeconds defaults to 10
maxNumberOfChecks defaults to 60

### GitHub Actions
```
on: push
jobs:
  process:
    runs-on: ubuntu-latest
    steps:
    - name: wait until https://www.cnn.com is up
      uses: r26d/wait_for_status@v0.1.0
      with:
	url: https://www.cnn.com
	statusCode: 200 
        checkIntervalSeconds: 10
	maxNumberOfChecks: 60
```




Based on Work by Wei
[Wei He](https://github.com/wei) _github@weispot.com_


## License
MIT - r26D,LLC
