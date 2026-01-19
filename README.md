# A clinically applicable connectivity signature for glioblastoma includes the tumor network driver CHI3L1 

Ling Hai (1,2,3,4)+, Dirk C Hoffmann (2,3,4)+, Robin J Wagener (2,3), Daniel D Azorin (2), David Hausmann (2,3), Ruifan Xie (2), Magnus-Carsten Huppertz (5), Julien Hiblot (5), Philipp Sievers (6,7), Sophie Heuer (2,3), Jakob Ito (2), Gina Cebulla (2), Alexandros Kourtesakis (2,3,4), Leon D Kaulen (2,3), Miriam Ratliff (2,8), Henriette Mandelbaum (2), Erik Jung (2,3), Ammar Jabali (9,10,11,12), Sandra Horschitz (9,10,11), Kati J Ernst (13,14), Denise Reibold (2), Uwe Warnken (2), Varun Venkataramani (2,3,15), Rainer Will (16), Mario L Suvà (17), Christel Herold-Mende (18), Felix Sahm (6,7), Frank Winkler (2,3), Matthias Schlesner (1,19), Wolfgang Wick (2,3), and Tobias Kessler (2,3)$

(1) Bioinformatics and Omics Data Analytics, German Cancer Research Center (DKFZ), Heidelberg, Germany
(2) Clinical Cooperation Unit Neurooncology, German Cancer Consortium (DKTK), German Cancer Research Center (DKFZ), Heidelberg, Germany
(3) Department of Neurology and Neurooncology Program, National Center for Tumor Diseases, Heidelberg University Hospital, Heidelberg, Germany
(4) Faculty of Biosciences, Heidelberg University, Heidelberg, Germany
(5) Department of Chemical Biology, Max Planck Institute for Medical Research, Heidelberg, Germany
(6) Department of Neuropathology, Institute of Pathology, University Hospital Heidelberg, Heidelberg, Germany
(7) Clinical Cooperation Unit Neuropathology, DKTK, DKFZ, Heidelberg, Germany
(8) Neurosurgery Clinic, University Hospital Mannheim, Mannheim, Germany
(9) Medical Faculty Mannheim, Central Institute of Mental Health, Heidelberg University, Mannheim, Germany.
(10) Hector Institute for Translational Brain Research, Mannheim, Germany.
(11) German Cancer Research Center (DKFZ), Heidelberg, Germany
(12) Institute of Reconstructive Neurobiology, School of Medicine & University Hospital Bonn, University of Bonn, Bonn, Germany
(13) Pediatric Glioma Research Group, DKTK, DKFZ, Heidelberg, Germany
(14) Hopp Children's Cancer Center at the NCT Heidelberg (KiTZ), Heidelberg, Germany
(15) Department of Neuroanatomy, Institute for Anatomy and Cell Biology, Heidelberg University, Heidelberg, Germany
(16) Genomics and Proteomics Core Facility, DKTK, DKFZ, Heidelberg, Germany
(17) Broad Institute of Harvard and MIT, Cambridge, MA 02142, USA; Department of Pathology and Center for Cancer Research, Massachusetts General Hospital and Harvard Medical School, Boston, MA 02114, USA
(18) Department of Neurosurgery, Heidelberg University Hospital, Heidelberg, Germany
(19) Biomedical Informatics, Data Mining and Data Analytics, Faculty of Applied Computer Science and Medical Faculty, University of Augsburg, Augsburg, Germany


+These authors contributed equally: Ling Hai, Dirk C Hoffmann
$Corresponding author: Tobias Kessler MD, Neurology Clinic and Neurooncology Program at the National Center for Tumor Diseases & DKTK, DKFZ, Im Neuenheimer Feld 400, D-69120 Heidelberg, Germany. Phone: +49 6221 56 7075, Fax: +49 6221 56 7554, E-mail: t.kessler@dkfz.de 

Tumor microtubes (TMs) connect glioma cells to a network with considerable relevance for tumor progression and therapy resistance. However, the determination of TM-interconnectivity in individual tumors is challenging and the impact on patient survival unresolved. Here, we establish a connectivity signature from single-cell RNA-sequenced (scRNA-Seq) xenografted primary glioblastoma (GB) cells using a dye uptake methodology, and validate it with recording of cellular calcium epochs and clinical correlations. Astrocyte-like and mesenchymal-like GB cells have the highest connectivity signature scores in scRNA-sequenced patient-derived xenografts and patient samples. In large GB cohorts, TM-network connectivity correlates with the mesenchymal subtype and dismal patient survival. CHI3L1 gene expression serves as a robust molecular marker of connectivity and functionally influences TM networks. The connectivity signature allows insights into brain tumor biology, provides a proof-of-principle that tumor cell TM-connectivity is relevant for patients’ prognosis, and serves as a robust prognostic biomarker. 

We here provide the codes that underly the interaction web app (https://connectivity-glioma.dkfz.de, https://zenodo.org/doi/10.5281/zenodo.10481240)

## Executing the app with Docker
The docker image dirkhoffmann92/connectivity-glioma:latest contains the run environment for the app including [ShinyServer](https://shiny.posit.co/r/articles/share/shiny-server/) and the require R packages. Importantly it does NOT contain the app R code itself, nor the data required to execute the app. These must be mounted into the container when it is launched.  

From inside of a folder with the following file structure:
```.
├── data
│   ├── choice.ann.rds # data
│   ├── choice.gene.rds # data
│   ├── Patient.Counts.rds # data
│   ├── Patient.Meta.rds # data
│   ├── PDX.Counts.rds # data
│   └── PDX.Meta.rds # data
├── log
├── shiny-server
│   └── Connectivity
│       └── app.R # the app code
└── shiny-server.conf # the shiny server configuration file (if you want overwrite the defaults)
```
The app can be launched with Docker
```
docker run -d -p 8080:3838 \
  -v ./shiny-server/Connectivity:/srv/shiny-server/Connectivity \
  -v ./log:/var/log/shiny-server \
  -v ./shiny-server.conf:/etc/shiny-server/shiny-server.conf \
  -v ./data:/Data \
  --name connectivity-glioma-app dirkhoffmann92/connectivity-glioma:latest
```
It will then be accessible via the URL http://<sever_ip_address>:8080/Connectivity

