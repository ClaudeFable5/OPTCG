-- AUTO-GENERATED: OP15-086 / 나미
-- rules_id=OP15-086 script_id=880002388 fingerprint=f554fcb03acfd5e4887a400110fe8991e89ecf0e7571c4153bf2b39963a79e4f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-086]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=7,
              trait=[[밀짚모자 일당]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_TRASH]],
            player=[[YOU]],
            rested=false,
          },
          {
            duration=[[THIS_TURN]],
            keyword=[[RUSH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[LAST_TARGET]],
              mode=[[UP_TO]],
              owner=[[CONTEXT]],
            },
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[밀짚모자 일당]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《밀짚모자 일당》 특징을 가진 경우, 자신의 트래시에서 코스트 7 이하인 《밀짚모자 일당》 특징을 가진 캐릭터 카드 1장까지를 등장시킨다. 이 효과로 등장시킨 캐릭터는 이번 턴 동안 【속공】을 얻는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-086]],
    schema_version=1,
  })
end
