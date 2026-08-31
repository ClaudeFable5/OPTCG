-- MANUAL: ST31-004 / 몽키 D. 루피 (2026-08-28 6색 스타트덱 ST31~36 추가)
-- JP 공홈 series 550031 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST31-004]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            keyword=[[RUSH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            count=3,
            op=[[ATTACHED_DON_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 부여되어 있는 두웅!!이 합계 3장 이상인 경우, 이 캐릭터는 【속공】을 얻는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            amount_per=-1000,
            divisor=1,
            duration=[[THIS_TURN]],
            filter={
              trait=[[밀짚모자 일당]],
            },
            op=[[MODIFY_POWER_PER_COUNT]],
            player=[[YOU]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            source=[[FIELD]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신 필드의 특징 《밀짚모자 일당》을 가진 카드 1장당, 상대의 캐릭터 1장까지를 이번 턴 동안 파워 -1000.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST31-004]],
    schema_version=1,
  })
end
