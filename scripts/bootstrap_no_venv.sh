#!/usr/bin/env bash
set -euo pipefail
PY="/bin/python3"

# Ensure pip exists (Codespaces Debian may need this once)
$PY -m pip --version >/dev/null 2>&1 || { 
  echo "Installing pip (requires sudo)..."
  sudo apt update && sudo apt install -y python3-pip
}

echo "[1/3] Install PyTorch (CPU) for /bin/python3..."
$PY -m pip install --user --break-system-packages torch --index-url https://download.pytorch.org/whl/cpu

echo "[2/3] Install core scientific stack..."
$PY -m pip install --user --break-system-packages numpy pandas scipy scikit-learn statsmodels patsy

echo "[3/3] (Optional) Install PyTorch Geometric core..."
$PY -m pip install --user --break-system-packages torch-geometric || true

cat <<'TIP'

✅ Environment ready.

Run your code:
  /bin/python3 code/main.py --model gcn --pred_len 6 --fold 1

If the program later complains about a missing PyG operator
(torch_scatter, torch_sparse, torch_cluster, torch_spline_conv),
install the CPU wheels that match your Torch version:

  TORCH_MM=$(/bin/python3 - <<'PY'
import torch, re
print(re.match(r'\d+\.\d+', torch.__version__).group(0))
PY
)
  PYG_INDEX="https://data.pyg.org/whl/torch-${TORCH_MM}+cpu.html"
  /bin/python3 -m pip install --user --break-system-packages torch-scatter     -f "$PYG_INDEX"
  /bin/python3 -m pip install --user --break-system-packages torch-sparse      -f "$PYG_INDEX"
  /bin/python3 -m pip install --user --break-system-packages torch-cluster     -f "$PYG_INDEX"
  /bin/python3 -m pip install --user --break-system-packages torch-spline-conv -f "$PYG_INDEX"

TIP
