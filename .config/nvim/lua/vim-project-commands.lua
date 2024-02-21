-- waybar helpers
vim.keymap.set("n", "<leader>rw", ":!killall waybar && sleep 2 && waybar -c /home/steph/.config/hypr/waybar/top/waybar-conf.json -s /home/steph/.config/hypr/waybar/top/style.css &<CR>", {})
