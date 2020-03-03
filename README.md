# analyzer-testing

You must have installed Ruby actual version.

## Environment Setup

#### DEV

* Install TrueAutomation Client:

```
bash <(curl -o- https://trueautomation.io/installer-dev.sh) <your-api-key>
```

* Put the "libtensorflow.so" and "libtensorflow_framework.so" files in the "/usr/local/lib" directory
* Put "saved_model" in any directory and specify path to its content through the TW3NN environment variable, for example:

```
export TW3NN=$HOME/.trueautomation/lib/saved_model
```

* Set environment variables to debug:

```
export TA_DEBUG=1
export TA_PAGE_DEBUG=1
```

* To enable or disable the threshold use variables:

```
export TW3_ENABLE_NOT_FOUND_THRESHOLD=false
export TW3_ENABLE_NOT_FOUND_THRESHOLD=true
```

* To set the threshold level:

```
export TW3_NOT_FOUND_THRESHOLD=0.98
```

#### PROD

* Install TrueAutomation Client:

```
bash <(curl -o- https://trueautomation.io/installer.sh) <your-api-key>
```

* Set environment variables to debug

## Project Setup:

* Clone the project

```
git clone https://github.com/stegrial/analyzer-testing.git
```

* Init the project using the: `trueautomation init` command
* Install necessary libraries: `bundle install`
* Run test

```
rspec <path-to-your-test> tag=<tag>
```

Tags you can use:

```
il, ep, record_debug, search_debug
```
