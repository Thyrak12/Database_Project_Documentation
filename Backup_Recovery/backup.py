import subprocess
import os

def backup_database(host, user, password, db_name, output_file):
    os.makedirs(os.path.dirname(output_file), exist_ok=True)

    command = [
        "mysqldump",
        f"--host={host}",
        f"--user={user}",
        f"--password={password}",
        db_name,
        f"--result-file={output_file}"
    ]
    print("Running command:", " ".join(command))

    result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    
    if result.returncode == 0:
        print(f"✅ Backup successful. File saved as {output_file}.")
    else:
        print(f"❌ Error:\n{result.stderr.decode('utf-8')}")

# Example usage
backup_database("localhost", "root", "", "test_database", "Backup_Recovery/db_project_backup.sql")
