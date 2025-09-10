# learn-azurebicep
Repository containing Azure bicep files.
## Getting Started

This repository is designed to help you learn Azure Bicep, a domain-specific language (DSL) for deploying Azure resources declaratively. You'll find sample Bicep files, deployment instructions, and best practices.

## Resources

- [Azure Bicep Documentation](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)
- [Bicep Playground](https://bicepdemo.z22.web.core.windows.net/)
- [Bicep GitHub Repository](https://github.com/Azure/bicep)

## How to Use

1. Clone this repository.
2. Review the sample Bicep files in the `bicep/` directory.
3. Deploy resources using the Azure CLI:
    ```sh
    az deployment sub create --location <location> --template-file <file>.bicep
    ```
4. Experiment and modify the files to deepen your understanding.

## Contributing

Feel free to submit issues or pull requests to improve the learning materials.