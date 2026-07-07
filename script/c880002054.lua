-- AUTO-GENERATED: P-060 / Tot Musica
-- rules_id=P-060 script_id=880002054 fingerprint=1a6e562d58922acbc5a1a49eefe981d14f386882692ae5665edba10a0a89a77e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-060]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[REST_DON]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              name=[[우타]],
            },
            kinds={
              [[LEADER]],
              [[CHARACTER]],
              [[STAGE]],
            },
            op=[[REST_OWN_CARD]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 「우타」 1장을 레스트할 수 있다: 상대의 두웅!!을 2장까지 레스트로 한다.]],
        timings={
          [[MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[P-060]],
    schema_version=1,
  })
end
