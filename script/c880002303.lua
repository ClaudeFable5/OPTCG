-- AUTO-GENERATED: OP15-001 / 클리크
-- rules_id=OP15-001 script_id=880002303 fingerprint=30ed832071c45827259493353f5f38cec1cf01b6511ccfbca2f3434cd59260ea
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-2000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              count=0,
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            op=[[ALL_OWN_CHARACTERS_HAVE_TRAIT]],
            player=[[YOU]],
            trait=[[이스트 블루]],
          },
        },
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【상대의 턴 동안】자신의 캐릭터가 《이스트 블루》 특징을 가진 캐릭터뿐인 경우, 상대의 모든 캐릭터의 파워 -2000.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                don_gte=2,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】상대의 두웅!!이 2장 이상 부여된 캐릭터 1장까지를 레스트로 한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-001]],
    schema_version=1,
  })
end
