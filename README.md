# Ministo

Ministo is a collection of scripts to display useful information when mining Monero, Wownero, or another CPU mined crpytocurrency.

## General Information:
### CPU Temps:
If sensors returns `coretemp` data the `getAverageCpuTemp.sh` script will return the average across all cores.

If sensors does not return `coretemp` it will look for `Tdie`. This is used for some Ryzen processors and is the tempurature of the CPU die.

### CPU MHz:
This is the average of all core MHz as reported by `/proc/cpuinfo`.

## Dependencies:
### Debian/Ubuntu/et. al.
```shell
sudo apt install sensors bc
```

### Arch, Manjaro. et. al.
```shell
sudo pacman -S sensors bc
```

### Artix Runing Open-RC
```shell
sudo pacman -S sensors sensors-openrc bc
```

## Using the Supplied Scripts in tmux:
### Install tmux:
#### Debian/Ubuntu/et. al
```shell
sudo apt install tmux

```
### Arch, Manjaro, Artix, et. al.
```shell
sudo pacman -S tmux
```

### Create tmux config directories:
```shell
mkdir -p $HOME/.config/tmux
```

### Link scripts to the tmux config directory
This ensures that any updates will be reflected without the need to manually copy in the future.
```shell
ln -s { path to ministo directory } $HOME/.config/tmux/getAverageCpuMHz.sh
ln -s { path to Ministo directory } $HOME/.config/tmux/getAverageCpuTemp.sh
```

### Add the following to tmux (customize as desired)
```shell
set -g status-interval 2
set-option -g status-right-length 150
set-option -g status-right "#[fg=white]#[bg=black]#[fg=white]#[bg=black]CPU: #(sh $HOME/.config/tmux/getAverageCpuMHz.sh) #(sh $HOME/.config/tmux/getAverageCpuTemp.sh) | "
```
