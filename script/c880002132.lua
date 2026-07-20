-- AUTO-GENERATED: EB03-029 / 무례한 것!! 물럿거라!!
-- rules_id=EB03-029 script_id=880002132 fingerprint=a52d7212f93b6ecb2e6c67eb6f223c92d6189b74ca696373004860381ca3cb43
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-029]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=6,
              trait_any={
                [[아마존 릴리]],
                [[구사 해적단]],
              },
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            name=[[보아 행콕]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=4,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】자신의 두웅!! 4장을 레스트할 수 있다: 자신의 리더가 「보아 행콕」인 경우, 자신의 패에서 코스트 6 이하인 《아마존 릴리》 또는 《구사 해적단》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            amount=3000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                name=[[보아 행콕]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【카운터】이번 배틀 동안, 자신의 「보아 행콕」 1장까지의 파워 +3000.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-029]],
    schema_version=1,
  })
end
