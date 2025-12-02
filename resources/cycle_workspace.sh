#!/usr/bin/env bash
# cycle_workspace.sh
# usage: cycle_workspace.sh next|prev

direction="$1"   # "next" or "prev"

# get active monitor name
activeMon=$(hyprctl -j monitors | jq -r '.[] | select(.focused == true).name')

# get workspaces on that monitor, sorted numerically
workspaces=($(hyprctl -j workspaces | jq -r --arg mon "$activeMon" '.[] | select(.monitor == $mon) | .id' | sort -n))

# get currently active workspace
current=$(hyprctl -j activeworkspace | jq -r '.id')

# find current index
idx=0
for i in "${!workspaces[@]}"; do
  if [[ "${workspaces[$i]}" == "$current" ]]; then
    idx=$i
    break
  fi
done

# compute new index (wrap-around)
if [[ "$direction" == "next" ]]; then
  newidx=$(( (idx + 1) % ${#workspaces[@]} ))
else
  newidx=$(( (idx - 1 + ${#workspaces[@]}) % ${#workspaces[@]} ))
fi

newws=${workspaces[$newidx]}

# switch workspace
hyprctl dispatch workspace "$newws"