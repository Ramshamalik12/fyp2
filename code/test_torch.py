import sys
print(f"Python executable: {sys.executable}")

try:
    import torch
    print(f"✓ PyTorch: {torch.__version__}")
    print(f"  CUDA available: {torch.cuda.is_available()}")
    
    import torch_geometric
    print(f"✓ PyTorch Geometric: {torch_geometric.__version__}")
    
    print("\n✅ PyTorch is installed in your virtual environment!")
except ImportError as e:
    print(f"❌ Error: {e}")
