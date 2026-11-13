# remote-sensing

Study knowledge base for the course **Remote Sensing Systems and Image Analysis**, read in
a dedicated Emacs reader (the [`knowledge-base`](https://github.com/4137314/knowledge-base)
flake input, as in the bachelor thesis and `computer-science`).

The course PDFs (parts 1–4b and the three laboratories) live in `asset/` and are not versioned.

## Layout

| path | content |
|---|---|
| `study/kb/physics/` | 10 notes: remote sensing system, EM spectrum, radiometric quantities, Planck, Stefan–Boltzmann and Wien, emissivity and Kirchhoff, Sun and Earth as sources, atmospheric windows and scattering, spectral signatures |
| `study/kb/acquisition/` | 26 notes: platforms, orbits (GEO, sun-synchronous, telecom), satellite architecture and data transmission, scanners (IFOV/GIFOV, DN, resolutions, PSF), multispectral and hyperspectral images, formats, radar equation, backscattering, radar bands, side-looking geometry and distortions, range and azimuth resolution, chirp, SAR, complex images, missions, Copernicus |
| `study/kb/processing/` | 23 notes: digital images, LUTs, histogram and statistics, stretching, equalisation, false colour, radiometric and geometric corrections, DFT and frequency filtering, moving-window and rank filters, edges, texture, homogeneous-area and speckle statistics, speckle filters, segmentation (thresholding, split and merge, region growing) |
| `study/kb/recognition/` | 19 notes: recognition systems, photointerpretation, features, NDVI, feature space, scattergram, discriminant functions, minimum distance, perceptron, Bayes, Gaussian maximum likelihood, k-means, accuracy assessment, neurons, MLP, backpropagation, CNNs, change detection, applications |
| `study/kb-config.el` | domains and areas in study order, forbidden words, LaTeX settings |
| `study/study.mk` | `make study*` targets |
| `study/remote-sensing.desktop.in` | launcher entry template |
| `flake.nix` | reader (`packages.study`) and a Python dev shell (NumPy, SciPy, scikit-learn, scikit-image, rasterio, Jupyter) for the laboratory exercises |

One note per concept, in English, with `REQUIRES` (prerequisites, an acyclic graph that
gives the study order) and `SEE` (lateral links). Formulas, TikZ/pgfplots figures and
`algorithmic` pseudocode are rendered to SVG; code examples are Python, as in the laboratories.

## Use

```sh
make study-install    # once: build the reader, check and render the notes, add "Remote Sensing" to the launcher
make study            # open the base (same as launching "Remote Sensing")
make study-check      # metadata, links, prerequisites, forbidden words, formulas and figures
make study-uninstall  # remove the launcher entry and the profile
nix develop           # Python environment for the exercises
```

The reader instance is `remote-sensing`: command `remote-sensing-study`, Emacs server
`remote-sensing`, state in `~/.local/state/remote-sensing-emacs`.
