import sys
print(f"Python path: {sys.executable}")

# Try importing your modules
try:
    import utils
    print("✅ utils imported successfully")
except Exception as e:
    print(f"❌ Error importing utils: {e}")

try:
    import baselines
    print("✅ baselines imported successfully")
except Exception as e:
    print(f"❌ Error importing baselines: {e}")

try:
    from parse import parse_args
    print("✅ parse_args imported successfully")
except Exception as e:
    print(f"❌ Error importing parse_args: {e}")

# Check if we can create a simple LO model
try:
    from baselines import Lo
    print("✅ Lo class imported successfully")
except Exception as e:
    print(f"❌ Error importing Lo: {e}")
