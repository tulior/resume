# Resume

This repository contains the Typst source and generated A4 PDF for my professional resume.

## Usage notice

This is a personal resume repository.

The resume content, professional history, biographical information, Typst source, generated PDF, GitHub Actions workflow, and repository assets are public for professional evaluation only. They are not licensed for reuse as a resume, template, product, dataset, training corpus, or publication.

See [LICENSE](./LICENSE) for details.

## Download

* [Download A4 resume PDF](./Tulio-Anjos-Senior-Software-Engineer-Resume.pdf)

## Source

The canonical resume source is:

```text
resume.typ
```

The A4 PDF is generated with the Typst CLI.

## Build locally

Install Typst 0.15.1 and `xxhash`, then run:

```bash
SOURCE_DATE_EPOCH=0 typst compile --ignore-system-fonts --font-path fonts resume.typ Tulio-Anjos-Senior-Software-Engineer-Resume.pdf
xxh128sum Tulio-Anjos-Senior-Software-Engineer-Resume.pdf > Tulio-Anjos-Senior-Software-Engineer-Resume.pdf.xxh128
```

The `fonts/` directory contains unmodified Source Sans 3 OpenType fonts from Adobe's 3.052R release, distributed under the [SIL Open Font License](./fonts/OFL.txt).

## GitHub Actions

The workflow builds the A4 PDF and generates its XXH128 checksum on pushes and pull requests that change the resume source, fonts, or workflow. Both files are available in the workflow artifact.

On qualifying pushes or manual runs on `main`, a separate publish job commits the PDF and its `.xxh128` file together. If `main` advances during the build, a manual run on the current `main` rebuilds from that revision.

To verify the PDF, install `xxhash` and run this command from the directory containing both files:

```bash
xxh128sum -c Tulio-Anjos-Senior-Software-Engineer-Resume.pdf.xxh128
```

## Files

```text
resume.typ
fonts/
Tulio-Anjos-Senior-Software-Engineer-Resume.pdf
Tulio-Anjos-Senior-Software-Engineer-Resume.pdf.xxh128
.github/workflows/resume.yml
LICENSE
```

## License

© 2026 Túlio Ribeiro dos Anjos. All rights reserved.

You may view this repository and download the generated resume PDF solely for evaluating my professional background. No other rights are granted.
