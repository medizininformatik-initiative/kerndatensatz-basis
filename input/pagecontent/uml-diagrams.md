This page provides UML class diagrams for the logical models of the MII core dataset base modules. These diagrams illustrate the relationships between the different data elements and classes.

### Person Module

The following diagram shows the logical structure of the Person module:

<div style="text-align: center; margin: 20px 0;">
{% include person-uml.svg %}
</div>

<style>
.uml-diagram-container svg {
  max-width: 100%;
  height: auto !important;
  width: auto !important;
}
</style>

---

### Treatment Case Module

The following diagram shows the logical structure of the Treatment Case module:

<div style="text-align: center; margin: 20px 0;">
{% include fall-uml.svg %}
</div>

#### Assignment of Care Units to Departments

The UML model distinguishes the static organizational assignment of care units from the hierarchy of individual encounters. The model allows care units to be assigned directly to a facility and represented without an additional department assignment. Care units may additionally be assigned to one or more departments. This supports centrally operated, temporary, or cross-departmental care units that do not have a single department assignment. A missing department assignment therefore does not imply that the care unit has no organizational owner; its association with the facility remains present.

The relationship between care units and departments is modeled as a regular many-to-many association rather than a composition because the same care unit can be shared by multiple departments. The relationship between facilities and departments is likewise modeled as a regular association: the UML diagram expresses organizational assignments, not shared lifecycles of the objects. This static assignment must not be interpreted as multiple `Encounter.partOf` references: in FHIR R4, an individual encounter can reference at most one parent encounter using `Encounter.partOf`. The same care unit can nevertheless be used as the location of different encounters, each in the context of its applicable department contact.

#### Recommended Relationship Between Department Contacts and Diagnoses

The Treatment Case UML diagram shows the department contact assigning a specific role to a diagnosis. The department contact represents the contact level currently recommended by the implementation guide. This is SHOULD-level guidance; other contact levels remain possible depending on the use case.

<style>
.uml-diagram-container svg {
  max-width: 100%;
  height: auto !important;
  width: auto !important;
}
</style>

### Diagnosis Module

The following diagram shows the logical structure of the Diagnosis module:

<div style="text-align: center; margin: 20px 0;">
{% include diagnose-uml.svg %}
</div>

The Diagnosis UML diagram shows the department contact as the general contact context of a diagnosis. The department contact represents the contact level currently recommended by the implementation guide. This is SHOULD-level guidance; other contact levels remain possible depending on the use case.

<style>
.uml-diagram-container svg {
  max-width: 100%;
  height: auto !important;
  width: auto !important;
}
</style>

### Procedure Module

The following diagram shows the logical structure of the Procedure module:

<div style="text-align: center; margin: 20px 0;">
{% include prozedur-uml.svg %}
</div>

The Procedure UML diagram shows the department contact as the general contact context of a procedure and thereby represents the implementation currently recommended by the implementation guide. Other contact levels remain possible depending on the use case.

<style>
.uml-diagram-container svg {
  max-width: 100%;
  height: auto !important;
  width: auto !important;
}
</style>
