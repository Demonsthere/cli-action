# Ory CLI docker action

This action packages the [ory cli](https://github.com/ory/cli) into a simple and reusable github action

## Inputs

## `command`

**Required** command to pass to the cli. Default `"help"`.

## Outputs

## `out`

Output of the command provided

## Example usage

```yaml
uses: actions/cli-action@v1
with:
  command: 'verision'
```
