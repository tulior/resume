# Resume

This repository contains the source files and generated PDFs for my professional resume.

## Usage notice

This is a personal resume repository.

The resume content, professional history, biographical information, Typst source, generated PDFs, GitHub Actions workflow, and repository assets are public for professional evaluation only. They are not licensed for reuse as a resume, template, product, dataset, training corpus, or publication.

See [LICENSE](./LICENSE) for details.

## Download

* [Download A4 resume PDF](./Tulio-Anjos-Senior-Software-Engineer-Resume.pdf)
* [Download Letter resume PDF](./Tulio-Anjos-Senior-Software-Engineer-Resume-Letter.pdf)

## Source

The canonical resume source is:

```text
resume.typ
```

The PDFs are generated with the Typst CLI.

## Build locally

Install Typst, then run:

```bash
typst compile --ignore-system-fonts resume.typ Tulio-Anjos-Senior-Software-Engineer-Resume.pdf --input paper=a4
typst compile --ignore-system-fonts resume.typ Tulio-Anjos-Senior-Software-Engineer-Resume-Letter.pdf --input paper=letter
```

## GitHub Actions

The workflow builds both A4 and Letter PDFs on pushes and pull requests that change the resume source or workflow.

On pushes to `main`, the generated PDFs are committed back to the repository only when the rendered output changes.

The workflow also enforces a two-page maximum for each generated PDF.

## Files

```text
resume.typ
Tulio-Anjos-Senior-Software-Engineer-Resume.pdf
Tulio-Anjos-Senior-Software-Engineer-Resume-Letter.pdf
.github/workflows/resume.yml
LICENSE
```

## License

© 2026 Túlio Ribeiro dos Anjos. All rights reserved.

You may view this repository and download the generated resume PDFs solely for evaluating my professional background. No other rights are granted.
