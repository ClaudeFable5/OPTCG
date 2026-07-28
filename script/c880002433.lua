-- AUTO-GENERATED: EB04-012 / 키쿠노죠
-- rules_id=EB04-012 script_id=880002433 fingerprint=ed90bb452ef000d884ccce871a4c5969029db525a529b08519e1b19e6cbc59ac
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-012]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
                trait=[[와노쿠니]],
              },
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            op=[[SELF_PLAYED_THIS_TURN]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】이 캐릭터가 등장한 턴인 경우, 자신의 《와노쿠니》 특징을 가진 리더를 액티브로 한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-012]],
    schema_version=1,
  })
end
