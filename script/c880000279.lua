-- AUTO-GENERATED: OP02-035 / 트라팔가 로
-- rules_id=OP02-035 script_id=880000279 fingerprint=da3ca66bf15ea19963c54f35c1615f55e0b59773cf528ced3022b9a61a62e094
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-035]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_eq=3,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[REST_DON]],
          },
          {
            op=[[RETURN_SELF_TO_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】➀(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다), 이 캐릭터를 주인의 패로 되돌릴 수 있다: 자신의 패에서 코스트 3인 캐릭터를 1장까지 등장시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-035]],
    schema_version=1,
  })
end
