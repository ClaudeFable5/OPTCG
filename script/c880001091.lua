-- AUTO-GENERATED: OP08-115 / 대지는 지지 않는다!!!
-- rules_id=OP08-115 script_id=880001091 fingerprint=36915a748e15f5a49e8465081a3daa481a0cbf3530735ef1c2aa0019e0a0d910
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-115]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=3000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            count=1,
            filter={
              name=[[어퍼 야드]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[샨도라의 전사]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】자신의 리더가 《샨도라의 전사》 특징을 가진 경우, 이번 배틀 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +3000. 그 후, 자신의 패에서 「어퍼 야드」를 1장까지 등장시킨다.]],
        timings={
          [[COUNTER]],
        },
      },
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[카드를 2장 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-115]],
    schema_version=1,
  })
end
