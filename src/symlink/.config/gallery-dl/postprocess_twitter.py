import json
import os
from pathlib import Path
import re

# Change to your destination
LOG_FILE = Path("~/.config/gallery-dl/user_names.json").expanduser()


def update_user_log(kwargs):
    try:
        author = kwargs["author"]
        author_id = str(author["id"])
        author_nick = str(author["nick"])
    except Exception as e:
        print(f"Error: {e}")
        return 1

    if not os.path.isfile(LOG_FILE):
        with LOG_FILE.open("w", encoding="utf-8") as f:
            json.dump({}, f, indent=4, ensure_ascii=False)

    with LOG_FILE.open(encoding="utf-8") as f:
        data = json.load(f)

    if author_id not in data:
        data[author_id] = author_nick
        with LOG_FILE.open("w", encoding="utf-8") as f:
            json.dump(data, f, indent=4, ensure_ascii=False)
        print(f"New user ID {author_id} with screen name '{author_nick}' added to log.")

    return 0


def rename_folder(directory):
    print("Finalize renaming...")
    if not os.path.isfile(LOG_FILE):
        print("{LOG_FILE} not found, initialize an empty dict")
        init = {}
        with LOG_FILE.open("w", encoding="utf-8") as f:
            json.dump(init, f, indent=4, ensure_ascii=False)
        return 0

    dir_path = Path(directory).parent
    with LOG_FILE.open(encoding="utf-8") as f:
        data = json.load(f)

    for folder in dir_path.iterdir():
        if folder.is_dir():
            match = re.match(r"^(.+)-(\d{8,})$", folder.name)

            if match:
                author_nick = match.group(1)
                author_id = match.group(2)

                if author_id in data:
                    old_nick = data[author_id]

                    # rename folder when author-nick changes
                    if author_nick != old_nick:
                        new_folder_name = f"{old_nick}-{author_id}"
                        new_folder_path = folder.parent.joinpath(new_folder_name)

                        folder.rename(new_folder_path)
            #             # Uncomment to enable log message
            #             print(f"Renamed folder: {folder} -> {new_folder_path}")
            #     else:
            #         print(f"Author ID {author_id} not found in data, skip.")
            # else:
            #     print(f"Folder '{folder.name}' does not match the expected format.")
    return 0


if __name__ == "__main__":
    import sys

    if len(sys.argv) != 4:
        print("Usage: python3 postprocess_twitter.py <user_id> <nick_name> <directory>")
        sys.exit(1)

    user_id, nick_name, directory = sys.argv[1:]
    rename_folder(directory)


# Move files (deprecated)
# def move_file(user_id, directory, filename, data):
#     """rename each file (rename their folder)"""
#     file_path = Path(directory).joinpath(filename)

#     regex = r"\(\[ID(\d+)\]-\[(\d{8})\]\)-(\d+)-(\d{2}\.\w+)"
#     match = re.match(regex, filename)

#     if match:
#         date_part = match.group(2)
#         tweet_id_part = match.group(3)
#         num_ext = match.group(4)

#         author_nick = data[user_id]

#         if author_nick == file_path.parent.name:
#             print("Author not changed, not moving file.")
#             return 0

#         new_name = f"[ID{user_id}]-[{date_part}]-{tweet_id_part}-{num_ext}"
#         new_directory = Path(directory).parent.joinpath(author_nick)
#         new_directory.mkdir(parents=True, exist_ok=True)
#         new_path = new_directory.joinpath(new_name)

#         os.rename(file_path, new_path)
#         print(f"Moved: {file_path} -> {new_path}")

#     else:
#         print(f"Something went wrong on '{filename}', no changes made.")

#     return 0
