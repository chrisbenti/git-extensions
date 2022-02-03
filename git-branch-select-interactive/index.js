const cliSelect = require("cli-select");
const execBare = require("shelljs").exec;

const exec = cmd => execBare(cmd, { silent: true }).stdout.trim();

branches = exec("git branch --no-color --format='%(refname:short)'")
  .trim()
  .split("\n");
cliSelect(
  {
    values: branches
  },
  resp => {
    exec(`git checkout ${resp.value}`);
  }
);
