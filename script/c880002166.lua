-- AUTO-GENERATED: OP14-001 / 트라팔가 로
-- rules_id=OP14-001 script_id=880002166 fingerprint=9c6525b344b18b3719674e8afa6bebe14df1f77445ecfcff100589b43e83dce6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[SWAP_BASE_POWER]],
            selector={
              count=2,
              filter={
                trait_any={
                  [[초신성]],
                  [[하트 해적단]],
                },
              },
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 《초신성》이나 《하트 해적단》 특징을 가진 캐릭터 2장을 고른다. 고른 캐릭터 각각의 원래 파워를, 이번 턴 동안, 맞바꾼다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-001]],
    schema_version=1,
  })
end
