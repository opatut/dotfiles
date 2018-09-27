# Cinnamon settings export

See also https://github.com/linuxmint/Cinnamon/wiki/Backing-up-and-restoring-your-cinnamon-settings-(dconf).

## Export

```bash
dconf dump /org/cinnamon/ > cinnamon-settings
```

## Load

```bash
dconf load /org/cinnamon/ < cinnamon-settings
```

## Reset

```bash
dconf reset -f /org/cinnamon/
```

