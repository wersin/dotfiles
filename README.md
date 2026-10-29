# dotfiles
these are some of the dotfiles for my setup i am currently using, as for now (12.12.2017)

some helpful sites for terminal customization:

[term colors](http://stayradiated.github.io/termcolors-web/)

[sexy terminal](http://terminal.sexy/)

[.bashrc made easy](http://bashrcgenerator.com/)



## claude

[Claude Code](https://claude.com/claude-code) config, symlinked into `~/.claude`:

- `CLAUDE.md` – global instructions (escalate to the `escalate` agent when stuck)
- `settings.json` – default model `opusplan`, effort `high`, status line
- `statusline.sh` – status line showing folder, model and cost
- `agents/escalate.md` – Opus helper agent for problems the main session is stuck on

```sh
mkdir -p ~/.claude/agents
for f in CLAUDE.md settings.json statusline.sh agents/escalate.md; do
  ln -sf "$PWD/claude/$f" ~/.claude/$f
done
```
