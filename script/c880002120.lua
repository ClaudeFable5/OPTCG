-- AUTO-GENERATED: EB03-017 / 쥬얼리 보니
-- rules_id=EB03-017 script_id=880002120 fingerprint=dd3ee2ae51f7fb0418abb46af482e30a9afee515e432aca06615f2465d0762e3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-017]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
          {
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[CANNOT_BE_RESTED]],
            selector={
              count=1,
              filter={
                cost_lte=8,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[초신성]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《초신성》 특징을 가진 경우, 자신의 두웅!!을 1장까지 액티브로 한다. 그 후, 다음 상대의 엔드 페이즈 종료 시까지, 상대의 코스트 8 이하인 캐릭터 1장까지는 레스트로 할 수 없다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-017]],
    schema_version=1,
  })
end
