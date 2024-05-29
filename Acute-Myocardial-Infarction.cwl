cwlVersion: v1.0
steps:
  read-potential-cases-fhir:
    run: read-potential-cases-fhir.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  acute-myocardial-infarction-ami-elevation---primary:
    run: acute-myocardial-infarction-ami-elevation---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-fhir/output
  acute-myocardial-infarction-ami-thrombosis---primary:
    run: acute-myocardial-infarction-ami-thrombosis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: acute-myocardial-infarction-ami-elevation---primary/output
  acute-myocardial-infarction-ami---primary:
    run: acute-myocardial-infarction-ami---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: acute-myocardial-infarction-ami-thrombosis---primary/output
  lateral-acute-myocardial-infarction-ami---primary:
    run: lateral-acute-myocardial-infarction-ami---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: acute-myocardial-infarction-ami---primary/output
  acute-myocardial-infarction-ami-posterior---primary:
    run: acute-myocardial-infarction-ami-posterior---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: lateral-acute-myocardial-infarction-ami---primary/output
  acute-myocardial-infarction-ami-anterior---primary:
    run: acute-myocardial-infarction-ami-anterior---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: acute-myocardial-infarction-ami-posterior---primary/output
  acute-myocardial-infarction-ami-heart---primary:
    run: acute-myocardial-infarction-ami-heart---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: acute-myocardial-infarction-ami-anterior---primary/output
  subendocardial-acute-myocardial-infarction-ami---primary:
    run: subendocardial-acute-myocardial-infarction-ami---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: acute-myocardial-infarction-ami-heart---primary/output
  acute-myocardial-infarction-ami-inferior---primary:
    run: acute-myocardial-infarction-ami-inferior---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: subendocardial-acute-myocardial-infarction-ami---primary/output
  anteroseptal-acute-myocardial-infarction-ami---primary:
    run: anteroseptal-acute-myocardial-infarction-ami---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: acute-myocardial-infarction-ami-inferior---primary/output
  acute-myocardial-infarction-ami-unspecif---primary:
    run: acute-myocardial-infarction-ami-unspecif---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: anteroseptal-acute-myocardial-infarction-ami---primary/output
  other-acute-myocardial-infarction-ami---primary:
    run: other-acute-myocardial-infarction-ami---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: acute-myocardial-infarction-ami-unspecif---primary/output
  infarction---primary:
    run: infarction---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: other-acute-myocardial-infarction-ami---primary/output
  postoperative-acute-myocardial-infarction-ami---primary:
    run: postoperative-acute-myocardial-infarction-ami---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: infarction---primary/output
  acute-myocardial-infarction-ami-following---primary:
    run: acute-myocardial-infarction-ami-following---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: postoperative-acute-myocardial-infarction-ami---primary/output
  transluminal-acute-myocardial-infarction-ami---primary:
    run: transluminal-acute-myocardial-infarction-ami---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: acute-myocardial-infarction-ami-following---primary/output
  certain-acute-myocardial-infarction-ami---primary:
    run: certain-acute-myocardial-infarction-ami---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule18
      potentialCases:
        id: potentialCases
        source: transluminal-acute-myocardial-infarction-ami---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule19
      potentialCases:
        id: potentialCases
        source: certain-acute-myocardial-infarction-ami---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
  inputModule18:
    id: inputModule18
    doc: Python implementation unit
    type: File
  inputModule19:
    id: inputModule19
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
