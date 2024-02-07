/*
SPDX-License-Identifier: CC-BY-4.0
(c) Desenvolvido por Claudio Santiago + Jeff Prestes
This work is licensed under a Creative Commons Attribution 4.0 International License.
*/
pragma solidity 0.8.19;

/// @author Claudio Santiago
/// @title Valor Aleatorio
contract Faucet {

    mapping(address=>uint256) public atribuicoes;
    uint256 valorASerAtribuido;
    uint randNo = 0;

    event AconteceuUmaAtribuicao(address paraQuem, uint256 quanto);

    // @notice Fornece a quem chamar a transacao um valor aleatorio
    // @dev define um valor aleatorio a um endereco ethereum.
    // @return valor atual
    function atribuirValorAleatorio() public returns (uint256) {
        require(atribuicoes[msg.sender]==0, "Sinto muito. Voce ja teve sua chance");
        require(valorASerAtribuido < 256, "Sinto muito. Voce perdeu sua chance");
        valorASerAtribuido = uint (keccak256(abi.encodePacked (msg.sender, block.timestamp, randNo)))%1000;
        atribuicoes[msg.sender] = valorASerAtribuido;
        emit AconteceuUmaAtribuicao(msg.sender, valorASerAtribuido);
        return valorASerAtribuido;
    }

    
}