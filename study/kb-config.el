;;; kb-config.el --- the remote-sensing base for the knowledge-base reader -*- lexical-binding: t; -*-

;; Loaded by the reader (flake input knowledge-base, `mkReader') before the notes are read.

(setq kb-domains '("physics" "acquisition" "processing" "recognition")
      kb-areas
      '(;; physics: from radiation to the signature of a surface
        "systems" "radiation" "atmosphere" "signatures"
        ;; acquisition: platforms, satellites, optical sensors, radar, missions
        "orbits" "satellites" "optical-sensors" "radar" "missions"
        ;; processing: images, enhancement, corrections, filtering, SAR, segmentation
        "images" "enhancement" "corrections" "filtering" "sar-processing" "segmentation"
        ;; recognition: features, classifiers, neural networks, applications
        "features" "classification" "neural-networks" "applications")
      ;; Notes describe concepts: no pointers to the course material.
      kb-forbidden
      "\\b\\(?:TODO\\|FIXME\\|[Ss]lides?\\|[Ll]ectures?\\|[Ll]ezion[ei]\\|file:\\)\\b")

;; TikZ libraries for diagrams.
(kb-preamble-add "\\usetikzlibrary{shapes.multipart,shapes.geometric,matrix,patterns}")

;; Display formulas are rendered as inline $\displaystyle ...$: a wide text block keeps
;; them on one line instead of letting TeX break them at relations.
(kb-preamble-add "\\setlength{\\textwidth}{40cm}")
