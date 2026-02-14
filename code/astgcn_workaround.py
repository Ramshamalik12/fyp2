"""
Workaround for torch_geometric_temporal import issues
"""

class ASTGCN:
    """Dummy ASTGCN class to avoid import errors"""
    def __init__(self, *args, **kwargs):
        print("⚠️  Using dummy ASTGCN (torch_geometric_temporal not available)")
        self.dummy = True
    
    def forward(self, *args, **kwargs):
        import torch
        return torch.zeros(1)  # Return dummy output
