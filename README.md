# A Log Framework for Apex Development

## API Reference

### `addLog(logEntry)`

This function is used to collect log entries. These entries can be published all at once using the `publish` function.

#### Parameters

- `logEntry` (Type: String or Exception): The log entry to be added. This can be a string message or an exception.

#### Example

```javascript```
addLog('This is a new log entry'); <br/>
addLog(new Error('This is a new exception log entry'));


### `publish(logEntry)`

This function is used to publish a single log entry immediately. It can also be used to publish all log entries collected by addLog in a single call.

#### Parameters

- `logEntry` (Type: String or Exception): The log entry to be added. This can be a string message or an exception.

#### Example

```javascript```
publish('This is a new log entry'); </br>
publish(new Error('This is a new exception log entry')); </br>
publish(); // This will publish all log entries collected by addLog
