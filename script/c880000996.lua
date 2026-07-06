-- AUTO-GENERATED: OP08-020 / 드럼 왕국
-- rules_id=OP08-020 script_id=880000996 fingerprint=dc8e8745edb022c89c71749cfb8c839b9534e935b52aa1acb436b5769ec8c578
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-020]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              count=0,
              filter={
                trait=[[드럼 왕국]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】자신의 《드럼 왕국》 특징을 가진 모든 캐릭터의 파워 +1000.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-020]],
    schema_version=1,
  })
end
