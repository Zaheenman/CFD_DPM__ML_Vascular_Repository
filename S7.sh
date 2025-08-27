# Base path to the .foam files
base_path="Enter/user/specified/path"

# Loop to generate Python scripts 
for i in {1..50}; do
  if [ -d "$i" ]; then
    # Create outlet1.py
    cat > "$i/outlet1.py" <<EOF
from paraview.simple import *
paraview.simple._DisableFirstRenderCameraReset()

a1foam = OpenFOAMReader(FileName='${base_path}/${i}/${i}.foam')
a1foam.MeshRegions = ['patch/outlet1']
a1foam.CellArrays = ['U']
UpdatePipeline(time=2500.0, proxy=a1foam)

calculator1 = Calculator(registrationName='Calculator1', Input=a1foam)
calculator1.Function = 'mag(U)'
UpdatePipeline(time=2500.0, proxy=calculator1)

integrateVariables1 = IntegrateVariables(registrationName='IntegrateVariables1', Input=calculator1)
UpdatePipeline(time=2500.0, proxy=integrateVariables1)

SaveData('outlet1_integrated.csv',
         proxy=integrateVariables1,
         UseScientificNotation=1,
         FieldAssociation='Cell Data')

print(" 'outlet1_integrated.csv' exported with integrated cell data.")
EOF

    # Create outlet2.py
    cat > "$i/outlet2.py" <<EOF
from paraview.simple import *
paraview.simple._DisableFirstRenderCameraReset()

a1foam = OpenFOAMReader(FileName='${base_path}/${i}/${i}.foam')
a1foam.MeshRegions = ['patch/outlet2']
a1foam.CellArrays = ['U']
UpdatePipeline(time=2500.0, proxy=a1foam)

calculator1 = Calculator(registrationName='Calculator1', Input=a1foam)
calculator1.Function = 'mag(U)'
UpdatePipeline(time=2500.0, proxy=calculator1)

integrateVariables1 = IntegrateVariables(registrationName='IntegrateVariables1', Input=calculator1)
UpdatePipeline(time=2500.0, proxy=integrateVariables1)

SaveData('outlet2_integrated.csv',
         proxy=integrateVariables1,
         UseScientificNotation=1,
         FieldAssociation='Cell Data')

print("'outlet2_integrated.csv' exported with integrated cell data.")
EOF

    echo "Generated $i/outlet1.py and $i/outlet2.py"
  else
    echo "Error folder $i"
  fi
done

# Loop to run the Python scripts
for i in {1..50}; do
  if [ -d "$i" ]; then
    echo "Running scripts in folder $i..."
    (cd "$i" && pvpython outlet1.py)
    (cd "$i" && pvpython outlet2.py)
  else
    echo "Error folder $i"
  fi
done
