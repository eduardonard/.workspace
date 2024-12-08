#!/usr/bin/env python3

import curses
import os
import subprocess


class AppContext:
    def __init__(self, stdscr):
        self.stdscr = stdscr
        curses.curs_set(0)
        curses.start_color()
        curses.init_pair(1, curses.COLOR_RED, curses.COLOR_BLACK)
        curses.init_pair(2, curses.COLOR_WHITE, curses.COLOR_BLACK)

    def menu(self, options=None):
        if not options:
            options = {
            "Sync": lambda: self.menu({
                "Work": lambda: self.sync("work"),
                "Personal": lambda: self.sync("personal"),
                "Exit": lambda: None,
            }),
            "First Install": lambda: self.first_install(),
            "Exit": lambda: None,
        }
        current_row = 0
        menu_items = list(options.keys())

        while True:
            self.stdscr.clear()

            # Display menu options
            for idx, row in enumerate(menu_items):
                if idx == current_row:
                    self.stdscr.attron(curses.color_pair(1))  # Highlight selected option
                    self.stdscr.addstr(idx, 0, row)
                    self.stdscr.attroff(curses.color_pair(1))
                else:
                    self.stdscr.attron(curses.color_pair(2))  # Non-highlighted menu options
                    self.stdscr.addstr(idx, 0, row)
                    self.stdscr.attroff(curses.color_pair(2))

            self.stdscr.refresh()

            # Get user input
            key = self.stdscr.getch()

            if key == curses.KEY_UP and current_row > 0:
                current_row -= 1
            elif key == curses.KEY_DOWN and current_row < len(menu_items) - 1:
                current_row += 1
            elif key == ord('\n'):  # Enter key pressed
                selected_option = menu_items[current_row]
                self.stdscr.clear()
                self.stdscr.refresh()
                options[selected_option]()  # Call the selected function
                self.stdscr.getch()
                break

    def sync(self, type: str):
        i3_config = ""
        folder_path = ".config/i3/"
        new_folder_path = os.path.expanduser("~/.config/i3/config")
        y_offset = 0

        try:
            for entry in os.listdir(folder_path):
                full_path = os.path.join(folder_path, entry)
                if os.path.isfile(full_path):
                    # if name of file is all, skip it
                    if (type == "work" and entry == "config-personal") or (type == "personal" and entry == "config-work"):
                        continue

                    self.stdscr.addstr(y_offset, 0, f"Copied file: {full_path}")
                    with open(full_path, "r") as file:
                        i3_config += file.read()
                        i3_config += "\n" * 3
                    y_offset += 1
            y_offset += 1
        except FileNotFoundError:
            self.stdscr.addstr(y_offset, 0, f"Folder {folder_path} not found.")
            y_offset += 1
        except PermissionError:
            self.stdscr.addstr(y_offset, 0, f"Permission denied for folder {folder_path}.")
            y_offset += 1
        

        with open(new_folder_path, "w") as file:
            file.write(i3_config)

        self.stdscr.addstr(y_offset + 1, 0, "Press any key to return.")
        self.stdscr.refresh()



    def first_install(self):
        self.stdscr.addstr(0, 0, "Running first install...")
        self.menu({
            "Install apps": lambda: self.install_apps(),
            "Install ROFI": lambda: self.install_rofi(),
            "Install i3": lambda: self.install_i3(),
            "Exit": lambda: None
        })
        self.stdscr.refresh()
        self.stdscr.getch()
    
    def install_apps(self):
        self.stdscr.addstr(0, 0, "Running first install...")
        self.menu({
            "Common": lambda: subprocess.run(["./first-install/single/useful-apts.sh"]),
            "Personal": lambda: subprocess.run(["./first-install/single/useful-apts-personal.sh"]),
            "Work": lambda: subprocess.run(["./first-install/single/useful-apts-work.sh"]),
            "Exit": lambda: None
        })
        self.stdscr.refresh()
        self.stdscr.getch()
    
    def install_rofi(self):
        self.stdscr.addstr(0, 0, "Running first install...")
        subprocess.run(["./first-install/single/rofi.sh"])
        self.stdscr.addstr(1, 0, "ROFI installed.")
        self.stdscr.refresh()
        self.stdscr.getch()
    
    def install_i3(self):
        self.stdscr.addstr(0, 0, "Running first install...")
        subprocess.run(["./first-install/single/i3.sh"])
        self.stdscr.addstr(1, 0, "i3 and i3blocks installed.")
        self.stdscr.refresh()
        self.stdscr.getch()





def main(stdscr):
    app = AppContext(stdscr)
    app.menu()


if __name__ == "__main__":
    try:
        curses.wrapper(main)
    except KeyboardInterrupt:
        exit()
