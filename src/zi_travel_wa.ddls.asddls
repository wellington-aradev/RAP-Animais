@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface de viagem'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_TRAVEL_WA
  as select from ztraveldb_wa
  //Agência
  association [0..1] to /DMO/I_Agency   as _Agencia on $projection.AgenciaID = _Agencia.AgencyID
  //Cliente
  association [0..1] to /DMO/I_Customer as _Cliente on $projection.ClienteID = _Cliente.CustomerID

{
  key viagem_id                   as ViagemID,
      agencia_id                  as AgenciaID,
      cliente_id                  as ClienteID,
      data_inicio                 as DataInicio,
      data_fim                    as DataFim,
      @Semantics.amount.currencyCode: 'CodigoMoeda'
      taxa_reserva                as TaxaReserva,
      @Semantics.amount.currencyCode: 'CodigoMoeda'
      preco_total                 as PrecoTotal,
      codigo_moeda                as CodigoMoeda,
      descricao                   as Descricao,
      status_geral                as StatusViagem,
      @Semantics.user.createdBy: true
      criado_por                  as CriadoPor,
      @Semantics.systemDateTime.createdAt: true
      criado_em                   as CriadoEm,
      @Semantics.user.lastChangedBy: true
      ultima_modificacao_por      as UltimaModificacaoPor,
      @Semantics.systemDateTime.lastChangedAt: true
      ultima_modificacao_em       as UltimaModificacaoEm,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      ultima_modificacao_em_local as UltimaModificacaoEmLocal,

      /* Associações */
      _Agencia,
      _Cliente
}
