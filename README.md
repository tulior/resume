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

Install Typst, then run:

```bash
typst compile --ignore-system-fonts --font-path fonts resume.typ Tulio-Anjos-Senior-Software-Engineer-Resume.pdf
```

The `fonts/` directory contains unmodified Source Sans 3 OpenType fonts from Adobe's 3.052R release, distributed under the [SIL Open Font License](./fonts/OFL.txt).

## GitHub Actions

The workflow builds the A4 PDF on pushes and pull requests that change the resume source, fonts, or workflow.

On pushes to `main`, the generated PDF is committed back to the repository only when the rendered output changes.

The workflow also enforces a two-page maximum for the generated PDF.

## Files

```text
resume.typ
fonts/
Tulio-Anjos-Senior-Software-Engineer-Resume.pdf
.github/workflows/resume.yml
LICENSE
```

## License

© 2026 Túlio Ribeiro dos Anjos. All rights reserved.

You may view this repository and download the generated resume PDF solely for evaluating my professional background. No other rights are granted.
