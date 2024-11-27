# README

## Automated Image Generation

The goal of this project is to automate the generation of molecular images based on PDB files. The workflow is divided into three main stages: data downloading, the image generation script, and automation using `Make`.

### 1. Data Downloading
- Each student was assigned 5 PDB IDs listed in a shared file `assigned-PDB-ids.tsv`.
- Using my name, I extracted the IDs assigned to me and saved them in a file named `my_ids.txt`.
- The data was downloaded using the script `downloadPDB`. All downloaded files are stored in the `inputs/` directory.
- Download logs for each file are saved in the `logs/` directory.

### 2. Image Generation Script
The script is written in `bash` and accepts the following parameters:
1. The `select` command argument for `Jmol`.
2. The name of the PDBx file.
3. The output file name (in `png` or `pnm` format).

Optional arguments:
- `-r`: Specifies the file name to store the `Jmol` rotation commands.
- `-o`: (Optional) Accepts a file with additional `Jmol` commands for improved secondary structure visualization.

Supported additional commands:
- `color (on|off|only)`
- `wireframe (only|on|off)`
- `calculate hbonds`
- `zoom [0-9]+`
- `hbonds [0-9]+`
- `color (chain|cpk|structure)`
- `trace (on|off)`

### 3. Automation with `Make`
- Image generation is automated using the `Make` script system.
- Each image has a separate script stored in the `cases/` directory.
- The scripts accept the following parameters:
  - The image generation script name with its path.
  - Paths to the directories `inputs/`, `outputs/`, `subOptionsFiles/`, and `rotationFiles/`.

- The `Makefile` performs the following tasks:
  1. Automatic testing using scripts in the `tests/` directory.
  2. Data downloading based on the ID list in the file `my_ids.txt`.

### Directory Structure
- `inputs/`: PDB files.
- `logs/`: Download logs.
- `outputs/`: Generated images.
- `cases/`: Scripts for individual image generation.
- `subOptionsFiles/`: Files with additional `Jmol` commands.
- `rotationFiles/`: Files with `Jmol` rotation commands.
- `tests/`: Test scripts.
## Usage:
1. To run the tests, simply execute the `make` command:
    ```bash
    make
    ```

2. Test results are displayed in the console.
